cmake_minimum_required(VERSION 3.16)

project(Baraza2 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 6.6 REQUIRED COMPONENTS WebEngineQuick WebView Core Gui Widgets)


qt_standard_project_setup()

qt_add_executable(appBaraza2
    main.cpp
    appIcon.rc
)

qt_add_qml_module(appBaraza2
    URI Baraza2
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES HomePage.qml
    QML_FILES SideButtons.qml
    QML_FILES CustomButton.qml
    RESOURCES assets/_.png
    QML_FILES Home.qml
    RESOURCES assets/searchIcon.png
    RESOURCES assets/kenyanFlag.jpg
    QML_FILES CustomDropshadow.qml
    RESOURCES assets/ellipsis.png assets/share.png
    RESOURCES assets/background1.jpg assets/background3.jpg assets/background4.jpg assets/background5.jpg
    QML_FILES TileTemplate.qml
    RESOURCES assets/background6.jpg assets/background7.jpg assets/background8.jpg
    QML_FILES ButtonTemplate.qml
    RESOURCES assets/comments.png assets/usersViews.png
    RESOURCES assets/homeIcon.png
    RESOURCES assets/bills.png assets/contribution.png assets/dashboard.png assets/forum.png assets/learning.png assets/resources.png assets/survey.png
    RESOURCES assets/learnInfo.png assets/learnInfo1.png
    QML_FILES AllBills.qml
    RESOURCES assets/menuBars.png
    QML_FILES DynamicComponentLoader.js
    QML_FILES BillTileTemplate.qml
    RESOURCES assets/images/logodesign1.jpeg assets/images/logodesign2.jpg assets/images/logodesign3.jpeg assets/images/videoproduction1.jpg assets/images/videoproduction2.jpg assets/images/videoproduction3.jpeg assets/images/webdesign1.jpeg assets/images/webdesign2.jpeg assets/images/webdesign3.jpeg
    RESOURCES assets/group5.html assets/group5style.css
    RESOURCES assets/AIBill2023.html
    RESOURCES assets/copy.png assets/menu.png
    RESOURCES assets/copy.png assets/menu.png
    RESOURCES assets/search.png
    RESOURCES assets/backArrow.png
    RESOURCES assets/ClimateChangeBill.html assets/DataProtectionBill.html assets/EmploymentBill.html assets/FinanceBill2025.html
    QML_FILES ForumPage1.qml
    QML_FILES ForumPage1Flow.qml
    QML_FILES BigTileTemplate.qml
    QML_FILES SmallTileTemplate.qml
    RESOURCES assets/kenya.png
    RESOURCES assets/filters.png assets/settings.png
    RESOURCES appIcon.rc
    RESOURCES assets/kenya.ico
    QML_FILES PollsSurveys.qml
    RESOURCES assets/polling.png
    QML_FILES Polls.qml
    RESOURCES assets/arrowDown.png
    QML_FILES LearningHomePage.qml
    RESOURCES assets/bell.png
    RESOURCES assets/star.png
    QML_FILES LessonTemplate.qml
    QML_FILES LearningPageFlow.qml
    QML_FILES
    RESOURCES assets/close.png
    QML_FILES LearningContentPage.qml
    RESOURCES assets/Lesson1.html
    QML_FILES ContributorsPage.qml
    RESOURCES assets/edit.png
    RESOURCES assets/plus.png
    RESOURCES assets/userImage.png
    QML_FILES ContentTemplate.qml
    QML_FILES ContentFlowPage.qml
    QML_FILES LoginPage.qml
    RESOURCES assets/flagScenary.jpg assets/flagScenary1.jpg
    RESOURCES assets/continue.png
    QML_FILES CustomTextInput.qml
    RESOURCES assets/checkboxChecked.png
    QML_FILES PlainButton.qml
    RESOURCES assets/google.png
    RESOURCES assets/apple.png
    RESOURCES assets/freedomKenya.jpg assets/freedomKenya2.jpeg assets/kenyaFlag3.jpeg assets/mashujaa.jpg
    QML_FILES ResourcesPage.qml
    QML_FILES VideoTileTemplate.qml
    RESOURCES assets/playBtn.png
    QML_FILES HistoricalDocuments.qml
    QML_FILES HistoricalDocsTemplate.qml
    RESOURCES assets/archivedBills.jpeg assets/constitution.jpg assets/constitution1.png assets/impactfulBills.jpeg
)

#Telling the compiler to recognise the Windows RC language so we can set the icon
if (${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    enable_language("RC")
    set (WIN32_RESOURCES ${CMAKE_CURRENT_SOURCE_DIR}/windows/MyApp.rc)
endif()

#Setting the appIcon
if(WIN32)
    set(APP_ICON_RESOURCE_WINDOWS "${CMAKE_CURRENT_SOURCE_DIR}/appIcon.rc")
    set_target_properties(appBaraza2 PROPERTIES
        WIN32_EXECUTABLE TRUE
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
    )
    add_custom_command(TARGET appBaraza2 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy "${APP_ICON_RESOURCE_WINDOWS}" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/appBaraza2.ico"
    )
endif()

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appBaraza2 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBaraza2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appBaraza2
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Core
    PRIVATE Qt6::WebView
    PRIVATE Qt6::WebEngineQuick
    PRIVATE Qt6::Widgets
)

include(GNUInstallDirs)
install(TARGETS appBaraza2
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

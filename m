From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 22:51:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/granite: bump to version 5.4.0
In-Reply-To: <20200614163524.281536-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 14 Jun 2020 18:35:24 +0200")
References: <20200614163524.281536-1-fontaine.fabrice@gmail.com>
Message-ID: <87eepcy013.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > granite fails to build since bump to vala 0.46.6 in commit
 > 2723ff3333f4f31a06628692bb644552681f8226:

 > make[3]: Leaving directory '/tmp/instance-0/output-1/build/granite-0.4.1'
 > [  1%] Generating style-classes.c;Application.c;Drawing/Color.c;Drawing/BufferSurface.c;Drawing/Utilities.c;GtkPatch/AboutDialog.c;Services/Settings.c;Services/Logger.c;Services/Paths.c;Services/System.c;Services/Contractor.c;Services/ContractorProxy.c;Services/IconFactory.c;Services/SimpleCommand.c;Widgets/AlertView.c;Widgets/Avatar.c;Widgets/Utils.c;Widgets/WrapLabel.c;Widgets/AboutDialog.c;Widgets/ModeButton.c;Widgets/DatePicker.c;Widgets/Entries.c;Widgets/TimePicker.c;Widgets/CollapsiblePaned.c;Widgets/StaticNotebook.c;Widgets/DynamicNotebook.c;Widgets/CompositedWindow.c;Widgets/AppMenu.c;Widgets/Welcome.c;Widgets/WelcomeButton.c;Widgets/Toast.c;Widgets/ToolButtonWithMenu.c;Widgets/PopOver.c;Widgets/ContractorView.c;Widgets/ContractorMenu.c;Widgets/DecoratedWindow.c;Widgets/LightWindow.c;Widgets/StatusBar.c;Widgets/SidebarPaned.c;Widgets/StorageBar.c;Widgets/SourceList.c;Widgets/CellRendererExpander.c;Widgets/CellRendererBadge.c;Widgets/ThinPaned.c;Widgets/OverlayBar.c
 ;gr
 >  anite.vapi;granite.h
 > make[3]: Entering directory '/tmp/instance-0/output-1/build/granite-0.4.1'
 > /tmp/instance-0/output-1/build/granite-0.4.1/lib/Application.vala:145.9-145.26: error: Creation method of abstract class cannot be public.
 >         public Application () {
 >         ^^^^^^^^^^^^^^^^^^

 > So bump granite to latest version to include the following commit (that
 > does not apply cleanly on current version):
 > https://github.com/elementary/granite/commit/fd26013c84afdeb6300ae2f4a574856753fc2b58

 > Moreover:
 > - Switch site to github to get latest release
 > - Switch to meson-package
 > - Add gobject-introspection optional dependency

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3e2cc89b9bd42824731d0c7b39dd5b5c98e527ee

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard

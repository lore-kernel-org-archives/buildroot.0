From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Tue, 31 Mar 2009 09:44:54 -0500
Subject: [Buildroot] User defined packages?
Message-ID: <FD8B1EC7-BDA6-4BF5-9A65-5BF62E054683@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As a noob on this list, if there isn't already a way to add user  
defined packages, could I suggest the following?

In package/Config.in add the following line:

source "user_package/Config.in"

In a new directory named "user_package" have a file called Config.in  
with the following:

menu "User Packages"
source "package/YourUserDefinedPackage/Config.in"
endmenu

The advantage to this is that it allows users to add to their list of  
packages without affecting (or in anyway touching) the files within  
the "package" directory. And it gives noobs such as myself a feeling  
of security that they aren't messing up something important.

Cheers,

Lloyd

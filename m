From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Tue, 31 Mar 2009 10:32:40 -0500
Subject: [Buildroot] User defined packages?
In-Reply-To: <FD8B1EC7-BDA6-4BF5-9A65-5BF62E054683@cannasoftware.com>
References: <FD8B1EC7-BDA6-4BF5-9A65-5BF62E054683@cannasoftware.com>
Message-ID: <C4F8C7C0-1ED2-49F5-961A-12D7BA1E9C8F@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mar 31, 2009, at 9:44 AM, Lloyd Sargent wrote:

> As a noob on this list, if there isn't already a way to add user  
> defined packages, could I suggest the following?
>
> In package/Config.in add the following line:
>
> source "user_package/Config.in"
>
> In a new directory named "user_package" have a file called Config.in  
> with the following:
>
> menu "User Packages"
> source "package/YourUserDefinedPackage/Config.in"
> endmenu
>
> The advantage to this is that it allows users to add to their list  
> of packages without affecting (or in anyway touching) the files  
> within the "package" directory. And it gives noobs such as myself a  
> feeling of security that they aren't messing up something important.

FYI, I realize it will take more than just getting it in the  
menuconfig, but wanted to float this idea.

Cheers,

Lloyd

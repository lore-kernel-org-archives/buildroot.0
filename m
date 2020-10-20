From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Tue, 20 Oct 2020 09:52:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-19
In-Reply-To: <cmu-lmtpd-14552-1603177825-0@imapb020.mykolab.com>
References: <cmu-lmtpd-14552-1603177825-0@imapb020.mykolab.com>
Message-ID: <d069842fd57ec66ed44b0b5461d08286@zgyarmati.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All, 

what to do with this build error? The build fails due to not recent
enough cmake version (3.13.4, while quazip requires >=3.15). Currently
the BR2_CMAKE_VERSION_MIN (in check-host-cmake.mk) set to 3.10. Should
we increase that one to 3.15? Or should we select then host cmake in
quazip's Config.in (as in the master branch BR's own cmake is already
3.15, and i assume if it selected, it will be also used to configure the
package)? Or patch quazip's CMakeLists.txt and set the minimal cmake
version also to 3.10? 

Thx, regards,
Zoltan Gyarmati 

On 2020-10-20 09:10, Thomas Petazzoni wrote:

> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
> arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
> arm      |           quazip-1.1           | http://autobuild.buildroot.net/results/4cb93530d98ee384b0aa53f8d6efe21d8f439a96
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201020/3e0dfeda/attachment.html>

From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 14:30:25 +0200
Subject: [Buildroot] [Bug 11781] mariadb build error
In-Reply-To: <bug-11781-163-KrCeA0FlTy@https.bugs.busybox.net/>
References: <bug-11781-163@https.bugs.busybox.net/>
 <bug-11781-163-KrCeA0FlTy@https.bugs.busybox.net/>
Message-ID: <25771c05-71c3-cb00-9e46-3a4ddc6d68c1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Ryan, care to take a look at this mariadb build failure?

 Regards,
 Arnout

On 13/04/2019 14:28, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=11781
> 
> --- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
> I can confirm a build failure, but the error is in fact from this (I think):
> 
> CMake Error at cmake/os/Linux.cmake:29 (STRING):
> STRING sub-command REPLACE requires at least four arguments.
> Call Stack (most recent call first):
> CMakeLists.txt:101 (INCLUDE)
> 
> CMake Error at cmake/os/Linux.cmake:29 (STRING):
> STRING sub-command REPLACE requires at least four arguments.
> Call Stack (most recent call first):
> CMakeLists.txt:101 (INCLUDE)
> 
> 
> Note that mariadb doesn't get built in the autobuilders because it comes from a
> choice.
> 

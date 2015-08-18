From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Aug 2015 19:03:32 +0300
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
Message-ID: <20150818160332.GX2765@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

On Tue, Aug 18, 2015 at 11:12:51AM -0400, James Knight wrote:
> Now, my first attempts were just to build and install my "core" rpm
> package using my host system's rpm package. That didn't work since my
> rpm-support on my Fedora system (4.12) doesn't generate the same rpm
> database format used by the current rpm package version found in
> Buildroot (5.2). Hence, I needed a host variant of rpm to match my
> target system's rpm to produce a correct initial database.

An alternative solution would be to switch Buildroot to rpm 4.x (latest 
version is 4.12.0). The 4.x series seems to be more actively maintained than 
rpm5, and is the version of choice for most distros using rpm.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

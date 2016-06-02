From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 2 Jun 2016 21:36:51 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-06-01
In-Reply-To: <20160602063020.63CAE102A7B@stock.ovh.net>
References: <20160602063020.63CAE102A7B@stock.ovh.net>
Message-ID: <CAMo8BfJTrGzcWXMjjhEcc3abUUArDs8nej0qnHH0aA8nyOnaBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jun 2, 2016 at 9:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>     mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/133cdeaa0644405568c3e8fc003d73c4570fbc82/
>      powerpc |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/e162f46458f4948c75550d47710bee92f1602273/
>          arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/7ca74c9ea36321e1940ee2707af5745b7d4498d2/

> ERROR: make-4.2.tar.bz2 has wrong sha1 hash:
> ERROR: expected: 85ad14d08766201ffe71efa866f4fb91
> ERROR: got     : d78b84a219b4c16593544f541dff7eb765ce3d74

85ad14d08766201ffe71efa866f4fb91 is MD5, not SHA1.
Should be fixed by https://patchwork.ozlabs.org/patch/629406/

-- 
Thanks.
-- Max

From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 24 Oct 2014 11:48:51 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-23
In-Reply-To: <20141024063016.0D21A1014BF@stock.ovh.net>
References: <20141024063016.0D21A1014BF@stock.ovh.net>
Message-ID: <CAMo8BfKK1=DZF09GJMa__rw=z-i3pzMhNGy+pfY49f-PtKcZCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 24, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-10-23
>       xtensa |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/bfd1ca4afdd32e3cc251aab7ee2ae5e5293ced1c/

This fails because BR2_PREFER_STATIC_LIB is defined and the package
treats it the old way. I'll send a patch that adds dependency on
! BR2_PREFER_STATIC_LIB to aircrack-ng.

-- 
Thanks.
-- Max

From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 10 Oct 2014 17:49:29 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-09
In-Reply-To: <20141010063012.D7B521012DC@stock.ovh.net>
References: <20141010063012.D7B521012DC@stock.ovh.net>
Message-ID: <CAMo8BfKw9NCroCWfNdcDzxP5ZSX5JsuXtBdZpvx9xs1gMp_7-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 10, 2014 at 10:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/ccb67643055a63e90f8ffbcc18da7137db6d3fbe/
>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/89e1a6328e0105021a22858e97f12107ad786782/
>       xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/415966eab988b04b3f1ffa5ae1bdb9ff3665c3c1/

That's the same bug with --gc-sections we've put a workaround in
kmod-17, and now despite the workaround is still applied I see
--gc-sections in ldflags.

-- 
Thanks.
-- Max

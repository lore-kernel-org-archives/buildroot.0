From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Sep 2020 21:50:13 +0200
Subject: [Buildroot] [PATCH] package/uhd: boost-thread needs a toolchain
 without bug 64735
In-Reply-To: <20200901093729.544094-1-gwenj@trabucayre.com>
References: <20200901093729.544094-1-gwenj@trabucayre.com>
Message-ID: <d5ea5639-99d2-9f41-ad16-cdd5d19cf7f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/09/2020 11:37, Gwenhael Goavec-Merou wrote:
> boost-thread needs std::current_exception since version 1.71.0 and
> https://github.com/boostorg/exception/commit/386f5507cb8ec99c03ca535bea4f8bd61e0de910

 I was a bit confused about the subject line, because it talks about
boost-thread and the change is in uhd... It took me some time to understand that
this was simply propagating the existing dependency. So I've changed the subject
line to "package/uhd: propagate toolchain bug 64735 dependency from boost-thread".

 Also, I tried to apply to master and that failed obviously. In the future,
please use `--subject-prefix=PATCH/next` to make it clear it applies to next,
not master.

 Applied to next, thanks.

 Regards,
 Arnout

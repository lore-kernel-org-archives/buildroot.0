From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 11:03:50 +0100
Subject: [Buildroot] [PATCH v7 5/8] Introduce the variable
 BR2_TOOLCHAIN_HAS_UCONTEXT
In-Reply-To: <20190129093919.22060-5-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Tue, 29 Jan 2019 10:39:16 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-5-patrick.havelange@essensium.com>
Message-ID: <87zhrbx43d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

 > It is set when the platform exposes the struct ucontext_t.
 > This avoids duplication of logic inside each package requiring
 > the use of that type.

 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

 > ---
 > Changes v7:
 >   - none

 > Changes v6:
 >   - Wrap Config.in at 80 char

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 5 Nov 2013 07:54:57 +0000
Subject: [Buildroot] [PATCH] dropwatch: fix avr32 build failure
In-Reply-To: <87r4avoj37.fsf@dell.be.48ers.dk>
References: <1383471053-8243-1-git-send-email-spdawson@gmail.com>
 <87r4avoj37.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCPmrxM3y2vcqm31df2SffY0=fu0FKx8JdZ7xqkr-Kp5ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback Peter.

On 4 November 2013 23:14, Peter Korsgaard <jacmet@uclibc.org> wrote:
> I think you need to adjust the BR2_NEEDS_GETTEXT_IF_LOCALE condition in
> dropwatch.mk as well, and it would probably be better to handle it in
> dropwatch.mk for both cases instead of this patch + override.

Okay. Will rework the patch.

Simon.

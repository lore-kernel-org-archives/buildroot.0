From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 5 Nov 2013 07:43:10 +0000
Subject: [Buildroot] [PATCH] libsigsegv: fix avr32 build
In-Reply-To: <878ux3q28b.fsf@dell.be.48ers.dk>
References: <1383557629-13227-1-git-send-email-spdawson@gmail.com>
 <878ux3q28b.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCPaMsL6DfhwjuQL66cqE6ejqHch8C3ZnanejLOrRXZQBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback Peter.

On 4 November 2013 21:35, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Doesn't autoreconf work? I prefer to regenerate configure instead of
> patching it if possible.

Yes, that works. Will submit an updated patch.

Simon.

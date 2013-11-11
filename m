From: Simon Dawson <spdawson@gmail.com>
Date: Mon, 11 Nov 2013 10:50:20 +0000
Subject: [Buildroot] [PATCH] iozone: depends on threads
In-Reply-To: <20131111114428.27ab2ac0@skate>
References: <1384165234-18705-1-git-send-email-spdawson@gmail.com>
 <20131111114428.27ab2ac0@skate>
Message-ID: <CAHt8ZCNxkCmZ0y-EOEWn5HTWVj9rV0qDOaAVA=Fxw3DZOsOueA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11 November 2013 10:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> No, this will make iozone invisible when building with external
> toolchains. See my other reply to the e-mail suggesting to add
> BR2_THREADS_NATIVE as a dependency.

Yes, I saw that, but too late. This looks to be more involved than I
had assumed it to be...

Simon.

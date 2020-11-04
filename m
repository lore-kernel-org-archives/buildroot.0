From: Florian La Roche <florian.laroche@googlemail.com>
Date: Wed, 4 Nov 2020 07:28:40 +0100
Subject: [Buildroot] [PATCH 1/1] grub-efi: align the rootfs to start at
 16MB offset from start of the image
In-Reply-To: <87a6vy5d5e.fsf@dell.be.48ers.dk>
References: <20201022101512.56470-1-Florian.LaRoche@gmail.com>
 <87a6vy5d5e.fsf@dell.be.48ers.dk>
Message-ID: <CANZrA2ZrT_RF3URh4HbPNW66-U4XGGVuUyjZ2Jw9Wn7fHKQN9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Am Di., 3. Nov. 2020 um 22:44 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
> Is there any specific reason for this or just that the offset looks
> "nicer"?

"nicer" is the only reason, not sure if newer hardware has any real
alignment reasons
that would benefit from this.

> Committed with these changes, thanks.

Thanks,

Florian La Roche

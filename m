From: =?UTF-8?Q?Rafa=C5=82_Fabich?= <rafal.fabich@gmail.com>
Date: Tue, 12 Mar 2013 12:17:27 +0100
Subject: [Buildroot] Q. How to use a custom kernel tree?
In-Reply-To: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
References: <CAHUKsLJM76BFzZunyc=6Jc=UUo4NKq=07_BHNRpVZwYc5VkkRg@mail.gmail.com>
Message-ID: <CAPRxd401a4OGpWaTu0OrC4nuSpxtNrwN=tuUB3esGvH+b6epJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Mar 8, 2013 at 4:47 PM, Chris Wilkinson <winstonian36@gmail.com> wrote:
>
> I have a customized, patched kernel tree which I'd like BR to use.
>
>
> It appears that BR expects to find the custom tarball in <BR>/dl, not the
> path I specified.
>
> What should I do to have BR use my custom kernel tree and config?
>

You can try this patch:
http://patchwork.ozlabs.org/patch/222743/


Best regards,
Rafal

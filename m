From: cem akpolat <akpolatcem@gmail.com>
Date: Tue, 10 Jun 2014 11:53:36 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as openvpn keys, conf
In-Reply-To: <CAMm5YqotyZ9y6c3vFXME+rh860RiB1X0RUFE=10k40yrzbM+fg@mail.gmail.com>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
 <CAHXCMMJsvZUPqtFwtKC=ZgSiNmwJ0A3_MYn=Fn0hbgi9iiz8Zg@mail.gmail.com>
 <CAMm5YqotyZ9y6c3vFXME+rh860RiB1X0RUFE=10k40yrzbM+fg@mail.gmail.com>
Message-ID: <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

The way that you explained is quite logical, however, I want to ask at that
point what is the main reason behind the creation of the "Root Overlay",
because for all packages and files , it is clearly seen that your defined
method will work. for instance I can easily create a package called
"toBeInstalledToRootFs" and then put all of them under this folder along
with an appropriate Makefile.

Best Regards,
Cem
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/5d04bd5e/attachment.html>

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 16:18:38 +0100
Subject: [Buildroot] [PATCH 22/38] supervisor: convert to the Python
 package infrastructure
In-Reply-To: <1386540907-7242-23-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-23-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LX7cRdt6mPDhYwuy3X91fA7kRAQ37T3jnF1T21uN27tDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2013 at 11:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Remove the select of BR2_PACKAGE_PYTHON_SETUPTOOLS, since what is
> really needed is host-setuptools (as can be seen from the original .mk
> file), and not setuptools for the target.
>
> Also, remove the manging of the Python shebang, since it's now done by

mangling

(and don't go to urbandictionary to search for the meaning of manging
or munging because it's sickening)

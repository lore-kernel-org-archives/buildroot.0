From: Ben Boeckel <mathstuf@gmail.com>
Date: Mon, 27 Feb 2017 15:40:13 -0500
Subject: [Buildroot] [PATCH] dependencies/cmake: blacklist cmake 3.7
In-Reply-To: <1488227076.14030.5.camel@embedded.rocks>
References: <1488148967-8055-1-git-send-email-yann.morin.1998@free.fr>
 <1488215544.31837.9.camel@embedded.rocks>
 <20170227172540.GA17670@free.fr>
 <1488225846.14030.1.camel@embedded.rocks>
 <20170227200827.GA14356@megas.kitware.com>
 <1488227076.14030.5.camel@embedded.rocks>
Message-ID: <20170227204013.GA1783@megas.kitware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 27, 2017 at 21:24:36 +0100, J?rg Krause wrote:
> For a detailed description, please have a look at my post [1] on the
> Buildroot mailing list some weeks ago.

Hmm. Is /usr/lib32 supposed to be an implicit runtime path? If so, why
is the compiler not indicating that?

--Ben

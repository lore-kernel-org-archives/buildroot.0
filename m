From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 30 Jun 2018 22:12:56 -0300
Subject: [Buildroot] [PATCH] dropbear: Disable legacy/insecure options
In-Reply-To: <20180507122844.30867-2-stefan.sorensen@spectralink.com>
References: <20180507122844.30867-2-stefan.sorensen@spectralink.com>
Message-ID: <20180701011256.18238-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan S?rensen wrote:

> Dropbear by default enables a number of algorithms that are now considered
> insecure and should only be used when legacy support is required:
>    3DES encryption
>    Blowfish encryption
>    SHA1-96 message integrity
>    CBC encryption mode
>    DSA public keys
>    Diffie-Hellman Group1 key exchange
> 
> So disable them by default, but add a config option for bringing them back.
> Furthermore the Blowfish legacy algorithm is unconditionally disabled
[...]

Looks good but after commit 037b8616257067282e375edca9af19418a0e7a4a it
needs to be rebased.

--
Carlos Santos
DATACOM P&D

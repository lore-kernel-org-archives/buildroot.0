From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 4 Jul 2018 10:45:17 +0200
Subject: [Buildroot] [PATCH v3] dropbear: Disable legacy/insecure options
In-Reply-To: <20180703103826.yk7jzpvg7xfhagr4@tarshish>
References: <20180703074810.19105-1-stefan.sorensen@spectralink.com>
 <20180703103826.yk7jzpvg7xfhagr4@tarshish>
Message-ID: <20180704084517.GC8766@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 03, 2018 at 01:38:26PM +0300, Baruch Siach wrote:
> Hi Stefan,
> 
> On Tue, Jul 03, 2018 at 09:48:10AM +0200, Stefan S?rensen wrote:
> > Dropbear by default enables a number of algorithms that are now considered
> > insecure and should only be used when legacy support is required:
> >    3DES encryption
> >    Blowfish encryption
> >    SHA1-96 message integrity
> >    CBC encryption mode
> >    DSA public keys
> >    Diffie-Hellman Group1 key exchange
> > 
> > So disable them by default, but add a config option for bringing them back.
> > Furthermore the Blowfish legacy algorithm is unconditionally disabled
> > 
> > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

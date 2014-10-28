From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 16:04:53 +0100
Subject: [Buildroot] Telnet client (inetutils)
In-Reply-To: <CABbD_XCzBtvwnoHjpBKU902MY9FQMcUGnbix3MVTP7vRde+cLA@mail.gmail.com>
References: <CABbD_XCzBtvwnoHjpBKU902MY9FQMcUGnbix3MVTP7vRde+cLA@mail.gmail.com>
Message-ID: <20141028160453.61f37172@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Tue, 28 Oct 2014 15:04:09 +0100, K?roly Kasza wrote:

> I think since commit
> http://git.buildroot.org/buildroot/commit/?id=560fe85bf7fb81956e80848c8bb28d7a6d00a2a2
> there is no
> telnet client in Buildroot if the user does not want to use Busybox (which
> is my case sometimes).
> Do you think adding the inetutils package, which provides a simple telnet,
> telnetd, ftp and ftpd and a few more utilities would
> be acceptable? It looks far more recent than netkit was (Jan. 2014 was the
> latest release).

It is certainly acceptable. Feel free to send a patch adding this
package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

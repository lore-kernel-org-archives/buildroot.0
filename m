From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 7 Sep 2018 12:44:43 +0200
Subject: [Buildroot] ADEOS patch and kernel override
Message-ID: <CAOf5uwmrFw_fKozkMn+5gVoehBig8g2PhE-ivg0GSv+PNcHfsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

I'm trying to understand if I can override the kernel and let apply
the adeos patch on top of it. Seems that PREHOOK is not called
in the linux kernel override directory. Is there some semantic to use?

Michael

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |

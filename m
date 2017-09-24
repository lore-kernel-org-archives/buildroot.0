From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:40:07 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/pinentry: added optional
 support for qt5
In-Reply-To: <20170917170958.5725-1-bernd.kuhls@t-online.de>
References: <20170917170958.5725-1-bernd.kuhls@t-online.de>
Message-ID: <a86a9d60-e2a3-39d4-8b08-6578fcd119ff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-09-17 19:09, Bernd Kuhls wrote:
> Upstream added support for qt5:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=abb59f50abf698ff1e56490fb39bcc98c26ab44b
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>


 Applied to master, thanks.

 Unfortunately, I messed up the commit message a bit. I though that the way you
handled the qt4/qt5 difference in the .mk file could be simplified and had
already said so in the commit message, but in the end my idea didn't work so I
reverted it, but I forgot to also revert the commit message. So, even though the
commit message says "completely separate qt4 and qt5 in the .mk file instead of
   making a complicated mix", I didn't actually do that.

 Regards,
 Arnout




-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

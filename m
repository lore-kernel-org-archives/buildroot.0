From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 00:24:14 +0100
Subject: [Buildroot] [PATCHv3 56/74] lighttpd: install init script and
	config file unconditionally
In-Reply-To: <20141130173835.GL4124@free.fr> (Yann E. MORIN's message of "Sun, 
 30 Nov 2014 18:38:35 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-57-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130173835.GL4124@free.fr>
Message-ID: <87y4qr54yp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Thomas, All,

>> +	$(INSTALL) -D -m 755 $(@D)/doc/config/conf.d/mime.conf \
 >> +		$(TARGET_DIR)/etc/lighttpd/conf.d/mime.conf

 > Config files installed 755, really? Can you fix that too, please?

Yeah, that seems wrong. I've added a commit changing all of these to
0644, thanks.

-- 
Bye, Peter Korsgaard

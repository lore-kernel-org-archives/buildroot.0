From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Apr 2013 23:58:56 +0200
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <CA+QJksJKDeogdcxtJz8PNwmv-nDQuMpdoLHG55Kq54shV5wWFw@mail.gmail.com>
 (thomas's message of "Thu, 25 Apr 2013 14:42:49 -0700 (PDT)")
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate>
 <1366918894609-44233.post@n4.nabble.com>
 <87ip3a9yzi.fsf@dell.be.48ers.dk>
 <1366919482310-44235.post@n4.nabble.com>
 <871u9y9vqd.fsf@dell.be.48ers.dk>
 <CA+QJksJKDeogdcxtJz8PNwmv-nDQuMpdoLHG55Kq54shV5wWFw@mail.gmail.com>
Message-ID: <87obd28e73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "thomas" == thomas  <thomas.spitz@gmail.com> writes:

 thomas> Hello Peter,

 thomas> Sorry for the novice question but I haven't manage to found the
 thomas> file where I need to remove --with-libexecdir=/usr/lib

Use latest git or apply this patch to your buildroot tree:

http://git.buildroot.net/buildroot/commit/?id=b6f71564fbee991a4a88202af541f4229bb99ff0

-- 
Bye, Peter Korsgaard

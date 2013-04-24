From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 22:08:36 +0200
Subject: [Buildroot] buildroot with vwdial and vwstreams
In-Reply-To: <1366832937.23813.YahooMailNeo@web133202.mail.ir2.yahoo.com>
 (P. Aus's message of "Wed, 24 Apr 2013 20:48:57 +0100 (BST)")
References: <1933FF812CF8714890A209D3BC03BA0A45BF15360D@SI-MBX03.de.bosch.com>
 <1366832937.23813.YahooMailNeo@web133202.mail.ir2.yahoo.com>
Message-ID: <878v47bsjf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "P" == P Aus stuttgart <handwerkundmehr@yahoo.de> writes:

Hi Pascal,

 P> according http://buildroot.uclibc.org/ you are the maintener of
 P> buildroot.  Is it possible to include wvdial and wvstreams in it?
 P> We are making an embedded system with an attached USB Modem
 P> GPRS/HDSPA/UMTS and we would like to simplyfing the system
 P> construction.  Thanks a lot.  Pascal

Yes it is possible, but nobody has submitted patches adding vwdial /
vwstreams yet. Perhaps you could do it?

See http://buildroot.net/downloads/manual/manual.html#adding-packages
for documentation about how to do this.

Feel free to submit the packages here on the mailing list once you're
done, so we can review and integrate them into future releases.

-- 
Bye, Peter Korsgaard

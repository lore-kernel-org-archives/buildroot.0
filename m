From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 22:23:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-c: security bump to
 version 0.10.0
In-Reply-To: <20191202175547.1306922-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Dec 2019 18:55:47 +0100")
References: <20191202175547.1306922-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8wqqv5m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add additional input validation to prevent integer overflow when parsing
 > a frame header. This addresses CVE-2019-18609.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 14:00:04 +0100
Subject: [Buildroot] [PATCHv2 30/36] python-json-schema-validator: new
	package
In-Reply-To: <1386793631-14026-31-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 11 Dec 2013 21:27:05 +0100")
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386793631-14026-31-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761qqw9pn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Ludovic Desroches <ludovic.desroches@atmel.com>
 > [Thomas: convert to the Python package infrastructure, fix license
 > informations.]

Ehh, you didn't do a very good job then ;)

 > +PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPLv3
 > +PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE_FILES = LICENSE.txt

cat: /home/peko/source/buildroot/output/build/python-json-schema-validator-2.3/LICENSE.txt: No such file or directory

But it is indeed LGPLv3. I don't see any license files, so I've dropped
this line and committed, thanks.

-- 
Bye, Peter Korsgaard

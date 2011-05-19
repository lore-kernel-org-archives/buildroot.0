From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 May 2011 20:03:38 +0200
Subject: [Buildroot] [PATCH 1/1] bind: give path to OpenSSL when OpenSSL
	is enabled
In-Reply-To: <8c5d5d15c623d3f93c48c58bb611b0a40e986ccb.1305825805.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 19 May 2011 19:23:29 +0200")
References: <cover.1305825805.git.thomas.petazzoni@free-electrons.com>
	<cover.1305825805.git.thomas.petazzoni@free-electrons.com>
	<8c5d5d15c623d3f93c48c58bb611b0a40e986ccb.1305825805.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87liy2tvnp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> bind needs to be specifically told where OpenSSL is, otherwise, the
 Thomas> build fails with:

 Thomas> checking for OpenSSL library... configure: error: OpenSSL was not found in any of /usr /usr/local /usr/local/ssl /usr/pkg /usr/sfw; use --with-openssl=/path
 Thomas> If you don't want OpenSSL, use --without-openssl

Committed, thanks.

-- 
Bye, Peter Korsgaard

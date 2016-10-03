From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 03 Oct 2016 10:43:01 +0200
Subject: [Buildroot] [PATCH v3 2/2] couchdb: New package.
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1467800649-22119-2-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <l9i9cdxqle.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Wed, 06 Jul 2016 12:24:09 +0200 schrieb Nicolas Cavallari:

> +	select BR2_PACKAGE_ERLANG

the elrang version provided by buildroot is detected as incompatible with 
couchdb 1.6.1:

checking Erlang version compatibility... detected Erlang version: 
7.3.0...configure: error: The installed Erlang version must be >= R14B 
(erts-5.8.1) and =< 17 (erts-6.0) major_version does not match

Regards, Bernd

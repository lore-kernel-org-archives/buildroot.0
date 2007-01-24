From: Daniel Laird <danieljlaird@hotmail.com>
Date: Wed, 24 Jan 2007 03:58:06 -0800 (PST)
Subject: [Buildroot] [PATCH] Add local directory for non-public packages
In-Reply-To: <053501c73f56$01663000$01c4af0a@atmel.com>
References: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
	<20070124001104.GB17761@codepoet.org>
	<053501c73f56$01663000$01c4af0a@atmel.com>
Message-ID: <8559127.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Do you need to patch the top level Config.in to include local/Config.in? I
think this is needed for the menuconfig stuff.

Cheers
Dan
-- 
View this message in context: http://www.nabble.com/-PATCH--Add-local-directory-for-non-public-packages-tf3078310.html#a8559127
Sent from the BuildRoot mailing list archive at Nabble.com.

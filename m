From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Apr 2019 00:03:08 +0200
Subject: [Buildroot] [PATCH 1/1] New package:
 https://github.com/ndilieto/uacme
In-Reply-To: <20190429213752.GA19636@einstein.dilieto.eu>
References: <20190429205511.GA18242@einstein.dilieto.eu>
 <20190429213752.GA19636@einstein.dilieto.eu>
Message-ID: <7876839a-8dd3-9918-3ed8-590e53bf3980@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/04/2019 23:37, Nicola Di Lieto wrote:
> My finger was faster than my brain...
> 
> I forgot to add Config.in and DEVELOPERS changes.

 So you noticed that :-)

 The rest of my review still stands, of course.

 Also, when you send an update, please:

1. add the version in the subject line (e.g. with 'git format-patch -v2')

2. Make sure the commit message is still relevant for posterity (i.e. no random
remarks like the above - those should go below the --- line).

3. Include a patch changelog [1] below a --- line below your Sob.

 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

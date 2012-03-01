From: Roland <rolandu@gmail.com>
Date: Thu, 01 Mar 2012 15:07:48 +0200
Subject: [Buildroot] adding a new machine configuration
Message-ID: <4F4F74A4.2060909@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I have created a new machine configuration file.

Target is Voipac iMX25 module ( http://voipac.com/#X25-DMM-254 ).

I'm gonna also create one for iMX51.

The problem is, the generated filesystem image won't work if don't 
change the fs/ubinize.cfg file (problem with alignment). And currently 
it's not possible to edit ubinize.cfg file in the buildroot 
configuration file.

I'm interested in sharing the config and other files so, it can be 
merged to buildroot's git.
But it's probably not possible until ubinize.cfg is configurable.

Any comments by the people, who have commit access?

Thanks,
Roland

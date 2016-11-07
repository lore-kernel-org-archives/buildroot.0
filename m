From: Michael Walle <michael@walle.cc>
Date: Mon, 07 Nov 2016 10:49:27 +0100
Subject: [Buildroot] genconfig/unconditonally include external.mk
Message-ID: <66befb0a3a9cb7c98c7a011aa985fb2f@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

there was a discussion (and rejected patches) [1] about adding support 
for buildroot config fragments. The conclusion was that this should not 
be part of buildroot and should stay external. But an integration would 
need unconditonal inclusion of the external.mk. The last mail about this 
subject was in July [2]. Are there any news on this topic?

[1] http://patchwork.ozlabs.org/patch/641840/
[2] http://lists.busybox.net/pipermail/buildroot/2016-July/167059.html

-michael

From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 11:58:35 +0200
Subject: [Buildroot] PATCH [2/2] try2: update x11r7 packages to
	use	NAME_PREFIX when calling AUTOTARGETS
In-Reply-To: <46FD8ECF.6040802@promwad.com>
References: <46FD7109.6000500@promwad.com> <20070928203734.GX20951@aon.at>
	<20070928204535.GY20951@aon.at> <46FD8ECF.6040802@promwad.com>
Message-ID: <20070929095835.GJ20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 02:31:27AM +0300, Ivan Kuten wrote:
>> ->>+$(eval $(call AUTOTARGETS,x11r7,xdriver_xf86-video-via))
>> +>>+$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-via))
>
>Updated all bulk x11r7/*/*.mk which use AUTOTARGETS.
>Patch is 130KB - it's gzipped to 11KB in the attachement

I've merged both as r20110.
Thanks!

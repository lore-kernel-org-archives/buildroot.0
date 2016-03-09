From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 11:51:29 +0100
Subject: [Buildroot] patch: **** Only garbage was found in the patch
	input.
In-Reply-To: <56DFFF22.4060207@proximus.be> (Johan Sagaert's message of "Wed, 
 9 Mar 2016 11:46:58 +0100")
References: <56DF6755.3080402@proximus.be> <871t7k41b9.fsf@dell.be.48ers.dk>
 <56DFFF22.4060207@proximus.be>
Message-ID: <874mcf3owe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Sagaert <sagaert.johan@proximus.be> writes:

Hi,

 >> Is this patch really something that is needed to fix a build issue of
 >> the package? From the file name it more sounds like som project specific
 >> customization of the rootfs. If that is so, why not just include the
 >> image in your rootfs overlay?
 >> 
 > I have to replace a logo bitmap in the u-boot sources that are pulled
 > from a git repository .
 > So  i will have to add a |PRE_BUILD_HOOK for the u-boot loader in this
 > case to replace the
 > logo bmp file before building, since diff cant create patches of
 > binary files.

Or commit the logo change to u-boot git (possibly after cloning it
somewhere else if this is upstream u-boot git).

-- 
Venlig hilsen,
Peter Korsgaard 

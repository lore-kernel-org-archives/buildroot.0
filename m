From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 28 Aug 2007 09:44:53 +0200
Subject: [Buildroot] Unable to Build mpg123 because of wrong patch file
In-Reply-To: <1188279394.31623.6.camel@localhost.localdomain>
References: <12360819.post@talk.nabble.com>
	<1188279394.31623.6.camel@localhost.localdomain>
Message-ID: <20070828074453.GA22348@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 28, 2007 at 07:36:34AM +0200, Hans-Christian Egtvedt wrote:
>On Mon, 2007-08-27 at 18:51 -0700, Hebbar wrote:
>> Hi All,
>> 
>>  I am trying to build mpg123 for arm arm926ejs toolchain. Today i tried
>> building mpg123 and failed because of wrong patch. Error message is attached
>> below. The Cause is that the Patch file tries to correct a non existent file
>> Makefile inside mpg123 folder just after uncompressing the mpg123 tar file.
>> It should patch the same after it has compiled. 
>
>Mpg123 version was bumped, and it now uses a proper autoconf script, so
>the patch is no longer needed.

>Nuke this patch from the repo (-:

$ svn log -r 19300 package/mpg123/mpg123.mk 
------------------------------------------------------------------------
r19300 | ulf | 2007-07-28 19:05:38 +0200 (Sat, 28 Jul 2007) | 1 line

Bump version of mpg123,use configure, change site to Sourceforge
------------------------------------------------------------------------

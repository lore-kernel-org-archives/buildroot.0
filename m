From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:36:50 -0200
Subject: [Buildroot] [next v2 5/7] testing/tests/download: add git hash
	tests
References: <d3d54a1a-73d6-eab2-9b54-721e124435bb@mind.be>
Message-ID: <59ed55c299546_5e463fc3acae34cc19163@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 06:44 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  Darn, I was too quick with my Rev-by tag...

OK, I will remove it.

> On 27-08-17 00:20, Ricardo Martincoski wrote:
> [snip]
>> diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
>> new file mode 100644
>> index 0000000000..2ad06fa47f
>> --- /dev/null
>> +++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
>> @@ -0,0 +1,12 @@
>> +################################################################################
>> +#
>> +# bad
>> +#
>> +################################################################################
>> +
>> +BAD_VERSION = 7446f8dab6cdb166aaf130aa88633dc627a4e8ad
>> +# Get the git server port number from the test infra
>> +GITREMOTE_PORT_NUMBER ?= 9418
> 
>  This is not OK, since the same variable is defined in multiple places. You can
> just put it in the external.mk instead.

OK.

Regards,
Ricardo

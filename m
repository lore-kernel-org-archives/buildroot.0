From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Mon, 2 May 2016 16:57:51 -0400 (EDT)
Subject: [Buildroot] [PATCH v1 2/4] msgpack: bump to version 1.4.0
In-Reply-To: <20160422232315.4ff76b30@free-electrons.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160422232315.4ff76b30@free-electrons.com>
Message-ID: <1427180000.363523.1462222671894.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

On Apr 22, 2016, at 5:23 PM, Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote:
> On Fri, 22 Apr 2016 16:57:06 -0400, Patrick Keroulas wrote:
> 
>> -MSGPACK_VERSION = 0.5.4
>> -MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
>> -MSGPACK_LICENSE = Apache-2.0
>> -MSGPACK_LICENSE_FILES = COPYING
>> +MSGPACK_VERSION = 1.4.0
>> +MSGPACK_SOURCE = msgpack-$(MSGPACK_VERSION).tar.gz
>> +MSGPACK_SITE =
>> https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)
>> +MSGPACK_LICENSE = Boost-1.0
>> +MSGPACK_LICENSE_FILES = LICENSE_1_0.txt
>> +MSGPACK_INSTALL_STAGING = YES
> 
> This seems like a major update. Did you check that the python-msgpack
> package, which depends on msgpack, was still building/working fine
> after this update?

python-msgpack is still building correctly and I successfully used basic functionalities of this python module.
Is there anything else I should verify?
Thanks,

Patrick

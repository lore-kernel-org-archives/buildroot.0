From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Dec 2015 17:59:54 -0300
Subject: [Buildroot] [PATCH 9/9] wireshark: add optional sbc support
In-Reply-To: <20151202205636.GR2193@tarshish>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-9-git-send-email-gustavo@zacarias.com.ar>
 <20151202205636.GR2193@tarshish>
Message-ID: <565F5BCA.4070802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/15 17:56, Baruch Siach wrote:

> Hi Gustavo,
>
> On Wed, Dec 02, 2015 at 05:48:21PM -0300, Gustavo Zacarias wrote:
>> +ifeq ($(BR2_PACKAGE_SBC),y)
>> +WIRESHARK_CONF_OPTS += --with-sbc=yes
>> +WIRESHARK_DEPENDENCIES += sbc
>> +else
>> +WIRESHARK_CONF_OPTS += --with-sbc=no
>> +endif
>
> Which package is that? I couldn't find BR2_PACKAGE_SBC in current master.

Hi Baruch.
http://patchwork.ozlabs.org/patch/545815/
Already warned Peter about that prereq on IRC.
Regards.

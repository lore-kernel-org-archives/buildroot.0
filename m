From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 12:04:38 -0300
Subject: [Buildroot] [PATCH v3 11/11] weston: handle libxml2 dependency
In-Reply-To: <20160330170257.5ec378e7@free-electrons.com>
References: <1459262350-10974-1-git-send-email-gustavo@zacarias.com.ar>
 <1459262350-10974-12-git-send-email-gustavo@zacarias.com.ar>
 <20160330170257.5ec378e7@free-electrons.com>
Message-ID: <56FBEB06.4000502@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/03/16 12:02, Thomas Petazzoni wrote:

>> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
>> +WESTON_CONF_OPTS += --enable-junit-xml
>> +WESTON_DEPENDENCIES += libxml2
>> +else
>> +WESTON_CONF_OPTS += --disable-junit-xml
>> +endif
>
> Do we really care about this JUnit XML output support ?
>
> Thomas

Probably not very useful, just wanted to cover all available possibilities.
Regards.

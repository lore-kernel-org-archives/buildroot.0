From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 08:51:20 -0500
Subject: [Buildroot] [PATCH v5 05/24] audit: new package
In-Reply-To: <CAHXCMML9oehV+CVYc6_NbDa6e8YHvORvV-ipbbGGr1WKSYuXpw@mail.gmail.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-6-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMML9oehV+CVYc6_NbDa6e8YHvORvV-ipbbGGr1WKSYuXpw@mail.gmail.com>
Message-ID: <CANn-YGS+9DWyk24DLthKJWfSTGK=yEiYYj70TN+AtwU1zOF5qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

>> +ifeq ($(BR2_armeb),y)
>> +       AUDIT_CONF_OPTS += --with-arm
>> +endif
>> +ifeq ($(BR2_arm),y)
>> +       AUDIT_CONF_OPTS += --with-arm
>> +endif
> This could be condensed in:
> ifeq ($(BR2_armeb)$(BR2_arm),y)
>        AUDIT_CONF_OPTS += --with-arm
> endif

I can make that change.

Thanks,
Clayton

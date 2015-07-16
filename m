From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 17 Jul 2015 00:57:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] gmock: new package
In-Reply-To: <372542373.3130789.1437079900388.JavaMail.zimbra@datacom.ind.br>
References: <1425304883-4332-2-git-send-email-casantos@datacom.ind.br>
 <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
 <CAHXCMML+4JgBr1msNmu8Z4Ja0FjmR1TficJq4d5nfnPXaXTg6A@mail.gmail.com>
 <1309988878.2915051.1437046491484.JavaMail.zimbra@datacom.ind.br>
 <372542373.3130789.1437079900388.JavaMail.zimbra@datacom.ind.br>
Message-ID: <CAHXCMMKC5rAgVqYdgCf5zbQZg-F0gZWawYhw9pYYEUgSdJ=c_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Thu, Jul 16, 2015 at 10:51 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
[...]
>
> Is there a way to select between host-python and host-python3? I can select either python or python3 via menuconfig in
>
>     Target packages -> Interpreter languages and scripting
>
> but this would add python to the target system.

When you select python3 for the target, the host-python3 is built and
set as default python interpreter in $(HOST_DIR) ; iow,
$(HOST_DIR)/usr/bin/python points to python3.

So the way of buiilding host-python3 is selecting python3 for the target.

Regards,

-- 
Samuel

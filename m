From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 May 2015 07:55:44 +0200
Subject: [Buildroot] [PATCH v5 06/24] policycoreutils: new package
In-Reply-To: <CAHXCMMJkUw7Pz9EmSB7p=uJfo2eEgp+JHcMrGVJOMJS4RPKMfg@mail.gmail.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-7-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMJkUw7Pz9EmSB7p=uJfo2eEgp+JHcMrGVJOMJS4RPKMfg@mail.gmail.com>
Message-ID: <CAHXCMM+AFohkGpj8bx-ZK3rtiHE8g5CScqx5gdtzbtp3wsQ3=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[...]
>> +$(eval $(generic-package))
>> +$(eval $(host-generic-package))
> What is the purpose of host-policycoreutils? I don't see it as
> dependency of policycoreutils...
Nvm, just see it's a deps of refpolicy.


-- 
Samuel

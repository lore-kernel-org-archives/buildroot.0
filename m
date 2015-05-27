From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 May 2015 10:52:34 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <CAJtzDg8wS89HmskSNaB60NkOZgg-WQoYGmQtmJGVa3zJHDuBCA@mail.gmail.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
 <20150527094643.0dcb2107@free-electrons.com>
 <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
 <20150527101333.1c2f6137@free-electrons.com>
 <CAJtzDg9TN7oH0owqeRu32p_=u=gtrjbwcAVjWabsO6=R+VT7tA@mail.gmail.com>
 <20150527103020.0aec65d2@free-electrons.com>
 <CAJtzDg8wS89HmskSNaB60NkOZgg-WQoYGmQtmJGVa3zJHDuBCA@mail.gmail.com>
Message-ID: <20150527105234.76b1512a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent Joli,

On Wed, 27 May 2015 10:35:26 +0200, Laurent Joli wrote:

> .-(/media/ljoli/disk_one/buildroot/buildroot-2015.05-rc3/output/build/linux-9bafbcba67f7bb2a48a5e05998cecb1165aa444f)----------------------------------------------------------------------------------------------------(ljoli at ljoli-MS-7823
> )-
> `--> grep SKY2 .config
> CONFIG_SKY2=y
> CONFIG_SKY2_DEBUG=y

So the driver is configured to be compiled statically in your kernel,
which explains why you don't have a kernel module generated.

> |EXPEMB|L?expertise au service de l?embarqu? ? Embedded Expert|
> P Merci de penser ? notre plan?te avant d?imprimer cet email - Please
> consider the environment before printing this mail
> Ce courriel (incluant ses ?ventuelles pi?ces jointes) peut contenir des
> informations confidentielles et/ou prot?g?es ou dont la diffusion est
> restreinte. Si vous avez re?u ce courriel par erreur, vous ne devez ni le
> copier, ni l?utiliser, ni en divulguer le contenu ? quiconque. Merci d?en
> avertir imm?diatement l?exp?diteur et d'effacer ce courriel de votre
> syst?me. La soci?t? d?cline toute responsabilit? en cas de corruption par
> virus, d?alt?ration ou de falsification de ce courriel lors de sa
> transmission par voie ?lectronique.
> This email (including any attachments) may contain confidential and/or
> privileged information or information otherwise protected from disclosure.
> If you are not the intended recipient, please notify the sender
> immediately, do not copy this message or any attachments and do not use it
> for any purpose or disclose its content to any person, but delete this
> message and any attachments from your system. Company disclaims any and all
> liability if this email transmission was virus corrupted, altered or
> falsified.

(Could you talk with your mail server admin to avoid including such
stupid e-mail footers? Asking to keep information confidential when
sending e-mails to a public mailing list doesn't make much sense.)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

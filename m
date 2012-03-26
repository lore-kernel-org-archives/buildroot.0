From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 26 Mar 2012 08:08:38 +0200
Subject: [Buildroot] [PATCH 2/2] Add bluez package.
In-Reply-To: <201203252229.44415.arnout@mind.be>
References: <1332463895-18574-1-git-send-email-marek.belisko@open-nandra.com>
 <CAGm1_ktDHM+7Z3TPJOWqi6qXKO15KNnzgFQH6=e-c4+qDUhmqw@mail.gmail.com>
 <CAAfyv35GO71OPa_JhuED+zSgSv+UOjZT258ipPXm-z7VDPnxRw@mail.gmail.com>
 <201203252229.44415.arnout@mind.be>
Message-ID: <CAAfyv36u3idaA01j79En-vEqV65hkBN1C=4mBXJVv5nz6jhoKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 25, 2012 at 10:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Friday 23 March 2012 09:28:37 Belisko Marek wrote:
>> On Fri, Mar 23, 2012 at 8:57 AM, Yegor Yefremov
>> <yegorslists@googlemail.com> wrote:
>> > We already have bluez package. package/bluez_utils/bluez_utils.mk and
>> > libbluetooth will be installed in staging. Am I missing something?
>> If wanna use just library you can save some space to not compile whole utils.
>
> ?But your not doing that AFAICS. ?You're using exactly the same source tar
> as bluez_utils, and you don't have any config option to disable the utils.
Arnout you're completely right. I messed it around. Sorry. Will stick
to bluez_utils.
>
> ?Regards,
> ?Arnout
>
>
> --
> Arnout Vandecappelle ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
> Senior Embedded Software Architect ? ? ? ? ? ? ? ? +32-16-286540
> Essensium/Mind ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium ? ? ? ? ? ? ? ?BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: ?7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

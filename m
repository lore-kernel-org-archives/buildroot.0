From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Sep 2013 08:16:04 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
 description for users
In-Reply-To: <20130902225514.7d9323cc@skate>
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina> <20130902225514.7d9323cc@skate>
Message-ID: <52257EA4.9030001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/13 22:55, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 02 Sep 2013 22:07:51 +0200, Thomas De Schampheleire wrote:
>
>>   if BR2_LEGACY
>>   comment "Your old configuration uses legacy options that no  "
>> -comment "longer exist in buildroot.                          "
>> -comment "Please look at the options which have been selected "
>> -comment "and read their help text.                           "
>> -comment "As long as these options stay selected, the build   "
>> +comment "longer exist in buildroot, as indicated in the menu "
>> +comment "below. As long as these options stay selected, or in"
>> +comment "case of string options are non-empty, the build     "
>>   comment "will fail.                                          "
>> +comment "*                                                   "
>> +comment "Where possible, an automatic conversion from old to "
>> +comment "new symbols has been performed. Before making any   "
>> +comment "change in this legacy menu, make sure to exit the   "
>> +comment "configuration editor a first time and save the      "
>> +comment "configuration. Otherwise, the automatic conversion  "
>> +comment "of symbols will be lost.                            "
>
> This really seems ugly for users, no? I know it's been discussed, but
> can you summarize why this should be done by our users?

  I.e., add "because of Kconfig limitations", right?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

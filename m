From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 22 Oct 2015 22:29:56 +0200
Subject: [Buildroot] [PATCHv5] package/openpowerlink: bump to v2.2.1
In-Reply-To: <56069672.4070505@openwide.fr>
References: <1439569225-7199-1-git-send-email-romain.naour@openwide.fr>
 <1439569225-7199-2-git-send-email-romain.naour@openwide.fr>
 <56069672.4070505@openwide.fr>
Message-ID: <56294744.2010205@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 26/09/2015 14:58, Romain Naour a ?crit :
> Hello,
> 
> Le 14/08/2015 18:20, Romain Naour a ?crit :
>> This new version break the API used in the v1.x but
>> this is a complete rewrite of the Powerlink EPSG DS 301
>> implementation.
>>
>> Add a top level CMakeLists.txt to build each openpowerlink
>> component without having to package each of them in a separate
>> Buildroot packages. Fixes the build system to support the top
>> level CMake build.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 

Recently I successfully switched from 1.8.5 openpowerlink stack to the 2.2.1
without any issue.
It would be great if this patch can be merged for the 2015.11 release :)

Best regards,
Romain

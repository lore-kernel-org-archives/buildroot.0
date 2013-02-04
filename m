From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 19:48:53 +0100
Subject: [Buildroot] Wireless config tool
In-Reply-To: <2613604.oY2r6Uxrru@sagittae>
References: <CAN_xxrXSRK6-DPKkC+8UAVAWQQExVkgGPk4vvPWfMs_DsnJ2ng@mail.gmail.com>
 <2613604.oY2r6Uxrru@sagittae>
Message-ID: <51100295.7030307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 18:42, J?r?me Pouiller wrote:
> Hi Stephen
>
> On Monday 04 February 2013 12:17:23 Stephen Turner wrote:
> [...]
>> My current question is if im using a mobile device that will be connecting
>> to various wifi hotspots i will need to be able to setup wifi connections
>> easily from a gui. currently with buildroot i only see the option to
>> manually edit configs to set up hotspots. Is there a tool im overlooking
>> currently in buildroot to help with this setup or will i need to manually
>> add one in? Im looking for something similiar to wicd or how a android
>> device would manage wifi connections.
> Have you thrown a look at network-manager?

  Or connman.

  Or if you would like to contribute wicd, we will certainly consider the 
patch!

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

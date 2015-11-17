From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Nov 2015 23:33:52 +0100
Subject: [Buildroot] [PATCH] readline: install configuration file from
 package recipe
In-Reply-To: <564BA4BF.7020106@mind.be>
References: <1447780732-21911-1-git-send-email-jezz@sysmic.org>
 <564BA4BF.7020106@mind.be>
Message-ID: <564BAB50.6010405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-11-15 23:05, Arnout Vandecappelle wrote:
> On 17-11-15 18:18, J?r?me Pouiller wrote:
>> /etc/inputrc is configuration file for readline. However, until now, it
>> was provided by skeleton. This patch install /etc/inputrc from readline
>> recipe.
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>> ---
>>  package/readline/inputrc     | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>  package/readline/readline.mk |  6 +++++-
>>  system/skeleton/etc/inputrc  | 44 --------------------------------------------
> 
>  Please use git format-patch -M or do
> git config --global --bool --add format.find-renames true
> git config --global --bool --add format.find-copies true

 I was writing this while offline so hadn't seen your v2 yet, sorry for the noise.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

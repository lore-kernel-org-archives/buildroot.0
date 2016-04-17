From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Apr 2016 16:10:50 +0200
Subject: [Buildroot] [PATCH 1/3] pcsc-lite: add hash file
In-Reply-To: <CAHkwnC9v3=LQ5ZwS6zR=Vksu5DX7nKpVPFaU8btr=GA-1U_BEg@mail.gmail.com>
References: <1460307570-10914-1-git-send-email-fabio.porcedda@gmail.com>
 <20160413214854.40918ecd@free-electrons.com>
 <CAHkwnC9v3=LQ5ZwS6zR=Vksu5DX7nKpVPFaU8btr=GA-1U_BEg@mail.gmail.com>
Message-ID: <5713996A.8080806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/17/16 00:55, Fabio Porcedda wrote:
> 2016-04-13 21:48 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
>> Hello,
>>
>> On Sun, 10 Apr 2016 18:59:28 +0200, Fabio Porcedda wrote:
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> ---
>>>   package/pcsc-lite/pcsc-lite.hash | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>   create mode 100644 package/pcsc-lite/pcsc-lite.hash
>>
>> All three patches applied. However, I've noticed that for the
>> googlefontdirectory package, the tarball is no longer available from
>> the original location, so it falls back to sources.buildroot.net:
>>
>>>>> googlefontdirectory undefined Downloading
>> --2016-04-13 21:43:02--  https://s3.amazonaws.com/joemaller_google_webfonts/googlewebfonts.tgz
>> Resolving s3.amazonaws.com (s3.amazonaws.com)... 54.231.9.136
>> Connecting to s3.amazonaws.com (s3.amazonaws.com)|54.231.9.136|:443... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2016-04-13 21:43:02 ERROR 404: Not Found.
>>
>> --2016-04-13 21:43:02--  http://sources.buildroot.net/googlewebfonts.tgz
>> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
>> Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
>> HTTP request sent, awaiting response... 200 OK
>> Length: 67082411 (64M) [application/x-gzip]
>> Saving to: ?/home/thomas/projets/buildroot/output/build/.googlewebfonts.tgz.OGDHJa/output?
>>
>> Can you see if there is a new appropriate location to download this
>> package?
>
> I've found the same contents in this repository:
> https://github.com/doublejosh/google-web-fonts  inside the file:
> https://github.com/doublejosh/google-web-fonts/blob/master/google-web-fonts-files-only.tar.gz?raw=yes
>
> If i understard correctly they are fonts available in
> https://www.google.com/fonts/
>
> Do you think is fine if i use file the following url to download it
> within buildroot?
> https://github.com/doublejosh/google-web-fonts/raw/979f3dd9d43a2c1627da8dc55cb4e9f041515714/google-web-fonts-files-only.tar.gz


  Looks great. And then you can give it a proper version: 
979f3dd9d43a2c1627da8dc55cb4e9f041515714


  Regards,
  Arnout

> Best regards
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

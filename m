From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Jul 2017 09:14:42 +0200
Subject: [Buildroot] [RFC PATCH v5 07/11] support/scripts: add
 reloacte-sdk.sh script for SDK relocation
In-Reply-To: <5d1f1a6e-084f-7530-0bdd-c2239b8bc47c@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-8-git-send-email-wg@grandegger.com>
 <778420e1-443a-355e-e2ac-edc3f91aa2d3@mind.be>
 <5d1f1a6e-084f-7530-0bdd-c2239b8bc47c@grandegger.com>
Message-ID: <CAHXCMML7nZOMjV6uicBB9szFnDFZ2b1ryQWhY8bcs1aTPrtOUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wolfgang,

On Tue, Jul 4, 2017 at 9:01 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>
> Am 04.07.2017 um 00:01 schrieb Arnout Vandecappelle:
>>
>>   Type in the subject: reloacte -> relocate
>>
>> On 30-06-17 10:37, Wolfgang Grandegger wrote:
[...]
>>> +newpath="$(sed -e "s\\${OLDPATH}\\${NEWPATH}\\g" "${LOCFILE}")"
>>
>>
>>   \\ is a bit a weird sed separator... We use % mostly, sometimes @ or ,.
>> But I'd
>> advise %.
>
>
> "%" and "@" are legal character of a file name. That's why I have chosen
> "\".

I think youcan choose one of the characters from [1] (my preference
would be either ':' or '|').

[1] https://en.wikipedia.org/wiki/Filename#Reserved_characters_and_words


Regards,

-- 
Samuel

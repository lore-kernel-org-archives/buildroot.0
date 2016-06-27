From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 Jun 2016 06:33:21 +0200
Subject: [Buildroot] [PATCH v9 01/11] core: split variables definition
 related to in/out-of-tree build from O itself
In-Reply-To: <e0557e8c-354e-6f56-a1e6-bfc28ae3abc2@mind.be>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
 <1461358223-18312-2-git-send-email-s.martin49@gmail.com>
 <e0557e8c-354e-6f56-a1e6-bfc28ae3abc2@mind.be>
Message-ID: <CAHXCMMLJ+iMf1asHQzffXE=OPw5PtS57v8qNaTsnOLYkC-PYdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 27, 2016 at 12:27 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 22-04-16 22:50, Samuel Martin wrote:
>> This change uncorrolates the CONFIG_DIR and NEED_WRAPPER definition from
>> the presence of the O variable in the command line.
>>
>> Now, the condition used to set these variables is the value of O itself.
>>
>> This change is a preparatory work since the O definition will need to
>> be moved around when we will make Buildroot run with absolute canonical
>> paths for both its root directory and the output location.
>> This will be addressed in a follow-up patch.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  (finally :-) but don't count on me being able to finish the series tonight)
Thanks, it's ok :)
Anyway, I think I'll have to resend this series after rebasing on top
of master (potential conflicts on Makefile due to some recent
patches).

Regards,


-- 
Samuel

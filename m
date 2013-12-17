From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 17 Dec 2013 10:30:34 -0600
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <CAAXf6LWDQYotYSqBh5H1aYc1B2PJYfDbK+FaF8hYt4VTpSnMzg@mail.gmail.com>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>	<1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>
 <CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>	<52B04F5E.1010602@mind.be>
 <OF15352E49.1C4D9698-ON86257C44.0049F2E1-86257C44.004F26CE@rockwellcollins.com>
 <CAAXf6LWDQYotYSqBh5H1aYc1B2PJYfDbK+FaF8hYt4VTpSnMzg@mail.gmail.com>
Message-ID: <OF95BAEB0A.7718FD18-ON86257C44.005A10F3-86257C44.005AAAF1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas D, Arnout,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/17/2013 
10:07:56 AM:

[...]
 
> I'm not sure we fully understand each other. My comment is not really
> about the looks of it, but rather about a missing part of the
> sentence. I don't really care about "if A then B" or "B, if A", it was
> just a suggestion. My main point is that there is no 'then' part on
> the if, making the whole sentence incomplete.
> 
> Unless you can convince me that this is correct English, I think this
> should be fixed in this patch and not in a followup.

I'm sorry I sent that email before Arnout said you were correct. Once he 
said you were correct, a light blub also went off and I corrected the 
issue for v5. The thread was a bit confusing there so by hopefully by 
sending a V5 of this patch all outstanding issues have been resolved.

As I stated previously, I intend to submit a follow-up series where I 
clean the patching up even further. For now though, I really want to get 
the ability to specify multiple BR2_GLOBAL_PATCH_DIR into mainline.

Thanks,
-Ryan

From: Gaye Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Wed, 29 Apr 2009 15:40:43 +0200
Subject: [Buildroot] HEADS UP: svn->git transition
In-Reply-To: <20090429132312.GA2431@yoda.jdub.homelinux.org>
References: <20090429113849.GB18534@mx.loc> <49F85AF3.4060501@t-online.de>
	<49F84E53.8060202@walsimou.com>
	<20090429132312.GA2431@yoda.jdub.homelinux.org>
Message-ID: <49F858DB.7030002@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Josh Boyer wrote:
> On Wed, Apr 29, 2009 at 02:55:47PM +0200, Gaye Abdoulaye Walsimou wrote:
>   
>> Bernd Schmidt wrote:
>>     
>>> Bernhard Reutner-Fischer wrote:
>>>
>>>       
>>>> We will be switching to git (instead of svn) for our repositories.
>>>>         
>>> Any particular reason?
>>>
>>> As far as I know, git works on local repositories.  How will we get
>>> things committed into a mainline repository?
>>>       
>> git pull <remote_repository>
>>     
>
> That's the opposite of what Bernd asked.  Or, depending on the context,
> only 1/2 of what he asked.
>
> Presumably you'll have a primary repo somewhere, and the maintainer(s)
> of that project will do pull from developer's repositories into their
> own local copies.  After vetting changes, the maintainer(s) will do a
> 'git push' to the primary public repo.
>
> josh
>   
My apologies, I misread Bernd, of course:

git clone <remote_repository> <local_repository>
git clone <remote_repository>

after changes...

git commit

git push

-- 
"Il est absolument possible qu'au del? de ce que per?oivent nos sens, se cachent des mondes
insoup?onn?s": Albert Einstein - cf Th?orie de la relativit?.
Le?on a tir? en sciences comme ailleurs: Ne jamais se fier aux apparences.

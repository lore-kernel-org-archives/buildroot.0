From: Arnar Mar Sig <antab@valka.is>
Date: Fri, 7 Mar 2008 08:57:08 +0000
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
In-Reply-To: <008b01c88027$780e44a0$040514ac@atmel.com>
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is>
	<008b01c88027$780e44a0$040514ac@atmel.com>
Message-ID: <4D6547F3-9672-4606-90EA-88630B3565E9@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mar 7, 2008, at 7:47 AM, Ulf Samuelsson wrote:

>>>> Added:
>>>> trunk/buildroot/package/editors/
>>>
>>> Why add hierarchy into the package directory?
>>>
>> It's getting a little crowded in the package/ directory so i added
>> this subdirectory
>>
>
> Guess what, searching "package/*/*.mk" will not find anything  
> related to editors.
>
This patch moves the other editors nano, uemacs and ed into packages/ 
editors and also moves the includes from package/Config.in into  
package/editors/Config.in. Makes the package/ dir a bit more organized.

http://mx1.opex.is/move-editor-patch.txt

Arnar Mar Sig

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: move-editor-patch.txt
Url: http://busybox.net/lists/buildroot/attachments/20080307/c0cee3bc/attachment-0001.txt 
-------------- next part --------------

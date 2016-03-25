From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 23:22:56 +0100
Subject: [Buildroot] [PATCH] busybox: security bump to version 1.24.2
In-Reply-To: <56F5B649.6080704@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 25 Mar 2016 19:06:01 -0300")
References: <1458942992-10172-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3eydxn7.fsf@dell.be.48ers.dk> <56F5B649.6080704@zacarias.com.ar>
Message-ID: <87bn62dwov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > Odd, it does apply if i download it from patchwork into a clean
 > buildroot tree.
 > I do get the warnings, but the whitespace is inherent in the CVE patches.

I cannot even get it from patchwork here:

pwclient get 602119
Traceback (most recent call last):
  File "/home/peko/bin/pwclient", line 500, in <module>
    main()
  File "/home/peko/bin/pwclient", line 465, in main
    action_get(rpc, patch_id)
  File "/home/peko/bin/pwclient", line 238, in action_get
    s = rpc.patch_get_mbox(patch_id)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
    return self.__send(self.__name, args)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
    verbose=self.__verbose
  File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
    return self.single_request(host, handler, request_body, verbose)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
    return self.parse_response(response)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1467, in parse_response
    p.feed(data)
  File "/usr/lib/python2.7/xmlrpclib.py", line 557, in feed
    self._parser.Parse(data, 0)
xml.parsers.expat.ExpatError: not well-formed (invalid token): line 142, column 22

-- 
Venlig hilsen,
Peter Korsgaard 

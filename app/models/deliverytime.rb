class Deliverytime < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '1~2日で発送' },
    { id: 2, name: '2~3で発送' },
    { id: 3, name: '4~7で発送' }
  ]
    
end
